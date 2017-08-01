module Api
  module V3
    class AuthController < Api::V3::ApplicationController
      include Sms::SendSms

      before_action :doorkeeper_authorize!, only: [:hello]

      def not_found
        raise ActiveRecord::RecordNotFound
      end

      def auth_code
        return head :ok if request.head?
        headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
        headers['Pragma'] = 'no-cache'
        data = generate_rucaptcha
        opts = {disposition: 'inline', type: 'image/gif'}
        send_data data, opts
      end

      def reg_mobile_code
        msg = '短信发送失败！'
        status= false
        if not params['mobile'].blank?
          random_code =SecureRandom.random_number(1000000)
          exp_time =Time.now().to_i + 600
          hash = Rails.cache.fetch("users/#{params["mobile"]}/send_msg/exp_time/600", :expires_in => (24-Time.now().hour()).hours) do
            {
                "phone" => "#{params["user_phone"]}",
                "random_code" => "#{random_code}",
                "created_at" => "#{Time.now.to_i}",
                "exp_time" => "#{exp_time}",
                "count" => "0"
            }
          end
          # puts("valid_code:#{random_code}")
          if not hash.nil? and not hash["count"].nil? and hash["count"].to_i ==0
            hash["random_code"] = random_code
            hash["count"] = hash["count"].to_i + 1
            hash["created_at"] = "#{Time.now.to_i}"
            hash["exp_time"] = exp_time
            Rails.cache.write("users/#{params["mobile"]}/send_msg/exp_time/600", hash, :expires_in => (24-Time.now().hour()).hours)
            status = Sms::SendSms.send_msg("#{params["mobile"]}", "验证码:#{random_code},请勿向陌生人提供你收到的验证码,以免造成损失。")
            msg = status ? "短信发送成功！" : "短信发送失败！"
          elsif not hash.nil? and not hash["count"].nil? and hash["count"].to_i < 5 and (Time.now.to_i - hash["created_at"].to_i) > 120
            hash["random_code"] = random_code
            hash["count"] = hash["count"].to_i + 1
            hash["created_at"] = "#{Time.now.to_i}"
            hash["exp_time"] = exp_time
            Rails.cache.write("users/#{params["mobile"]}/send_msg/exp_time/600", hash, :expires_in => (24-Time.now().hour()).hours)
            status = Sms::SendSms.send_msg("#{params["mobile"]}", "验证码:#{random_code},请勿向陌生人提供你收到的验证码,以免造成损失。")
            msg = status ? "短信发送成功！" : "短信发送失败！"
          elsif not hash.nil? and not hash["count"].nil? and hash["count"].to_i < 5 and (Time.now.to_i - hash["created_at"].to_i) <= 120
            msg ="发送过于频繁，请#{120 - (Time.now.to_i - hash["created_at"].to_i) }秒后重试"
          elsif not hash.nil? and not hash["count"].nil? and hash["count"].to_i >=5
            msg = "对不起，短信发送超过限制!"
          end
        end
        msg = "#{msg}#{status ? random_code : ''}"
        render json: {:status => status, :msg => msg}, status: 200

      end


      def login_or_register
        status= true
        msg =''
        if not params["vcode"].blank? and not params["mobile"].blank?
          hash = Rails.cache.read("users/#{params["mobile"]}/send_msg/exp_time/600")
          if not hash.nil? and not hash["random_code"].nil? and not hash["exp_time"].nil?
            if hash["exp_time"].to_i < Time.now.to_i and params["vcode"].to_s == hash["random_code"].to_s
              msg ="短信验证码已过期，请重新获取！"
            elsif hash["exp_time"].to_i > Time.now.to_i and params["vcode"].to_s == hash["random_code"].to_s
              status= true
            else
              msg ="验证失败！请重试！"
            end
          end
        end
        access_token=""
        params['mobile'] = params['username']
        if status && !params['client_id'].nil? and !params['client_secret'].nil?
          application = Doorkeeper::Application.find_by_secret(params['client_secret'])
          user = User.find_by_login(params['mobile'])
          if !application.nil? and !user.nil?
            access_token = Doorkeeper::AccessToken.find_or_create_for(application, user.id, "bearer", nil, true)
          elsif !application.nil? and user.nil?
            user = User.new(:login => params["mobile"], :email => "#{params["mobile"]}@phb.com")
            user.password = params["mobile"]
            user.password_confirmation = params["mobile"]
            user.save!
            msg ="注册成功！"
            access_token = Doorkeeper::AccessToken.find_or_create_for(application, user.id, "bearer", nil, true)
          else
            render plain: "401 Unauthorized", status: 401
            return
          end

        end
        render json: {:status => status, :msg => msg, :access_token => access_token.token, :data => user}, status: 200


      end

      def login
        status= true
        msg =''
        access_token=""
        params['mobile'] = params['username']
        if status && !params['client_id'].nil? and !params['client_secret'].nil?
          application = Doorkeeper::Application.find_by_secret(params['client_secret'])
          user = User.find_by_login(params['mobile'])
          if !application.nil? and !user.nil?
            access_token = Doorkeeper::AccessToken.find_or_create_for(application, user.id, "bearer", nil, true)
          elsif !application.nil? and user.nil?
            user = User.new(:login => params["mobile"], :email => "#{params["mobile"]}@phb.com")
            user.password = params["mobile"]
            user.password_confirmation = params["mobile"]
            user.save!
            msg ="注册成功！"
            access_token = Doorkeeper::AccessToken.find_or_create_for(application, user.id, "bearer", 86400, true)
          else
            render plain: "401 Unauthorized", status: 401
            return
          end

        end
        render json: {:status => status, :msg => msg, :access_token => access_token.token, :data => user}, status: 200
      end
    end
  end
end

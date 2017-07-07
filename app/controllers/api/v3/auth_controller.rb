module Api
  module V3
    class AuthController < Api::V3::ApplicationController
      before_action :doorkeeper_authorize!, only: [:hello]

      def not_found
        raise ActiveRecord::RecordNotFound
      end

      def auth_code
        return head :ok if request.head?
        headers['Cache-Control'] = 'no-cache, no-store, max-age=0, must-revalidate'
        headers['Pragma'] = 'no-cache'
        data = generate_rucaptcha
        opts = { disposition: 'inline', type: 'image/gif' }
        send_data data, opts
      end

      def send_sms
        status= false
        res = RuCaptcha.generate()

        msg = "短信发送失败！#{res[0]}"
        if not params["mobile"].blank?
          random_code =SecureRandom.random_number(1000000)
          exp_time =Time.now().to_i + 600
          hash = Rails.cache.fetch("users/#{params["mobile"]}/send_msg/exp_time/600", :expires_in => 10.minutes) do
            {
                "phone" => "#{params["user_phone"]}",
                "random_code" => "#{random_code}",
                "exp_time" => "#{exp_time}",
                "count" => "1"
            }
          end
          # puts("valid_code:#{random_code}")
          if not hash.nil? and not hash["count"].nil? and hash["count"].to_i < 4
            hash["random_code"] = random_code
            hash["count"] = hash["count"].to_i + 1
            hash["exp_time"] = exp_time
            Rails.cache.write("users/#{params["mobile"]}/send_msg/exp_time/600", hash, :expires_in => 10.minutes)
            # status = Sms::SendSms.send_msg({:mobiles=>"#{params["mobile"]}",:content=>"验证码:#{random_code},请勿向陌生人提供你收到的验证码,以免造成损失。"})
            status = true
            msg = status ? "短信发送成功！" : "短信发送失败！"
          elsif not hash.nil? and not hash["count"].nil? and hash["count"].to_i >3
            msg = "对不起，短信发送超过限制!"
          end
        end
        render json: {:status => status, :msg => msg}, status: 200

        # respond_with do |f|
        #   f.json {render json: {:status => status, :msg => msg}.to_json}
        # end
      end

      def valid_random_code
        status= false
        msg =""
        if not params["random_code"].blank? and not params["mobile"].blank?
          hash = Rails.cache.read("users/#{params["mobile"]}/send_msg/exp_time/600")
          if not hash.nil? and not hash["random_code"].nil? and not hash["exp_time"].nil?
            if hash["exp_time"].to_i < Time.now.to_i and params["random_code"].to_s == hash["random_code"].to_s
              msg ="短信验证码已过期，请重新获取！"
            elsif hash["exp_time"].to_i > Time.now.to_i and params["random_code"].to_s == hash["random_code"].to_s
              status= true
            else
              msg ="短信验证码错误！"
            end
          end
        end
        if status ==false
          msg= "验证失败！请重试"
        end
        render json: {:status => status, :msg => msg}, status: 200
        # respond_with do |f|
        #   f.json {render json: {:status => status, :msg => msg}.to_json}
        # end

      end
    end
  end
end

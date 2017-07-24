module Sms
  module SendSms

    def self.send_msg(phone, msg)
      status =true
      SmsLog.new(:mobile => phone, :content => msg, :channel => "253", :status => status ? 1 : 2, :return_str => "").save!
      status
    end

    def self.send_msg2(phone, msg)
      status =false
      sms_url = "http://smssh1.253.com"
      conn = Faraday.new(:url => sms_url)
      params ={"account": "N4321103",
               "password": "eg0TJbUvGH50a3",
               "msg": "【派红包】#{msg}",
               "phone": phone
      }
      # response = conn.post "/msg/send/json", params.to_json
      response =conn.post do |req|
        req.url 'msg/send/json'
        req.headers['Content-Type'] = 'application/json'
        req.body = params.to_json
      end
      # print "result2=======================#{response.body}"
      result = JSON.parse(response.body)
      if result['code'].to_s =="0"
        status =true
      else
        status =false
        # raise ArgumentError.new('sms send error code:'+result['code'].to_s)
      end
      SmsLog.new(:mobile => phone, :content => msg, :channel => "253", :status => status ? 1 : 2, :return_str => response.body).save!
      status
    end


  end
end
module Sms
  module SendSms

    def self.send_msg(hash)
      status =false
      sms_url = "http://119.145.9.12"
      conn = Faraday.new(:url => sms_url)
      params ={:enterpriseID=>15847,
               :loginName=>"admin",
               :password=>"07954ed9bdaf95513569e4caf5957585",
               #:content=>"",
               #:mobiles=>"",
               :smsId=>"",
               :subPort=>"",
               :sendTime=>""
      }.merge(hash)
      response = conn.post "/sendSMS.action" ,params
      #print "result=======================#{response.body}"
      if response.body.to_s.include?("<Result>0</Result>")
        status =true
      end
      status
    end

  end
end
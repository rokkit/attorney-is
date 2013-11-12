class Sms
  def initialize

  end

  def self.inform phone, message
      # client = Twilio::REST::Client.new(APP['twilio']['sid'], APP['twilio']['token'])
      # client.account.sms.messages.create(
      #   from: APP['twilio']['from'],
      #   to: "+#{phone}",
      #   body: message
      # )
      post_data = Net::HTTP.post_form URI.parse('http://smsc.ru/sys/send.php'),
       { 
         'login' => 'homeinfo',
         'psw' => 'h54fd54gfd88',
         'phones' => phone,
         'mes' => message,
         'sender' => 'АП СПБ',
         'charset' => 'utf-8'
       }
  end
end
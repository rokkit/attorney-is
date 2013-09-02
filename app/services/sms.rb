class Sms
  def initialize

  end

  def self.inform phone, message
      client = Twilio::REST::Client.new(APP['twilio']['sid'], APP['twilio']['token'])
      client.account.sms.messages.create(
        from: APP['twilio']['from'],
        to: "+#{phone}",
        body: message
      )
  end
end

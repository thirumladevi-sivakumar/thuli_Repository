class UserMailer < ActionMailer::Base
  default from: "from@example.com"
   def booking_confirmation(email,booking)
    @booking=booking
    mail(to: email , subject: "Thuli booking confirmation details")
  end
end

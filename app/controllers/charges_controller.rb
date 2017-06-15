class ChargesController < ApplicationController
	 before_action :authenticate_user!

  def new
  end

  def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
    )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
    )
    #Added to show 
      @payment = Payment.new
      @payment.user_id = current_user.id
      @payment.channel = "Stripe"
      @payment.active = true
      @payment.subscription = false
      @payment.plan = 5
      @payment.amount = 5
      @payment.save

rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
  redirect_to settings_path
end
    
    # def new
    # end

    # def create
    # # Amount in cents 500cents = 5$
    #   @amount = 500

    #   customer = Stripe::Customer.create(
    #     :email => params[:stripeEmail],
    #     :source  => params[:stripeToken]
    #   )

    #   charge = Stripe::Charge.create(
    #     :customer    => customer.id,
    #     :amount      => @amount,
    #     :description => 'Rails Stripe customer',
    #     :currency    => 'usd'
    #   )

    #   #Added for test to table fixet amount
    #   #current_user.payments.create(subscription: false, channel: "stripe", active: true, plan: 5, amount: 5)

    #   #Added to show 
    #   @payment = Payment.new
    #     @payment.user_id = current_user.id
    #     @payment.channel = "Stripe"
    #     @payment.active = true
    #     @payment.subscription = false
    #     @payment.plan = 5
    #     @payment.amount = 5
    #     @payment.save

    # rescue Stripe::CardError => e
    #   flash[:error] = e.message
    #   redirect_to new_charge_path
    #   # redirect_to settings_path
    #   # flash[:success] = t('payment.create_success')
    # end

end

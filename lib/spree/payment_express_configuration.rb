module Spree
  class PaymentExpressConfiguration < Preferences::Configuration
    preference :payment_express_local_confirm, :boolean, :default => true
  end
end

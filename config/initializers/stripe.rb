Rails.configuration.stripe = {
  publishable_key: Rails.application.credentials.stripe[:pk],
  secret_key: Rails.application.credentials.stripe[:sk]
}

Stripe.api_key = Rails.application.credentials.dig(:stripe, :sk)

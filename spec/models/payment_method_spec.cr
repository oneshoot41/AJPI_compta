require "./spec_helper"
require "../../src/models/payment_method.cr"

describe PaymentMethod do
  Spec.before_each do
    PaymentMethod.clear
  end
end

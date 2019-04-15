require "./spec_helper"
require "../../src/models/invoice.cr"

describe Invoice do
  Spec.before_each do
    Invoice.clear
  end
end

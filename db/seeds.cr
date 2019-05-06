require "../config/application.cr"

chq = PaymentMethod.new
chq.wording = "Chèque"
chq.save

cb = PaymentMethod.new
cb.wording = "Carte Bancaire"
cb.save

virement = PaymentMethod.new
virement.wording = "Virement"
virement.save

provider = UserType.new
provider.wording = "Fournisseur"
provider.save

customer = UserType.new
customer.wording = "Client"
customer.save

provider1 = User.new
provider1.name = "TERRA"
provider1.user_type_id = 1
provider1.save

provider2 = User.new
provider2.name = "MSI"
provider2.user_type_id = 1
provider2.save

provider3 = User.new
provider3.name = "Garage Renault"
provider3.user_type_id = 1
provider3.save

customer1 = User.new
customer1.name = "Mission Locale"
customer1.user_type_id = 2
customer1.save

customer2 = User.new
customer2.name = "BERTRAND Charles"
customer2.user_type_id = 2
customer2.save

customer3 = User.new
customer3.name = "DUTEIL Béatrice"
customer3.user_type_id = 2
customer3.save

customer_invoice1_paid = Invoice.new
customer_invoice1_paid.name = "Installation d'OS"
customer_invoice1_paid.amount = 320
customer_invoice1_paid.tva = 20
customer_invoice1_paid.date = Time.parse("2019-05-03", "%Y-%m-%d", Time::Location::UTC)
customer_invoice1_paid.paid = true
customer_invoice1_paid.user_id = 5
customer_invoice1_paid.payment_method_id = 2
customer_invoice1_paid.save

customer_invoice2_paid = Invoice.new
customer_invoice2_paid.name = "Vente PC Portable"
customer_invoice2_paid.amount = 650
customer_invoice2_paid.tva = 20
customer_invoice2_paid.date = Time.parse("2019-05-03", "%Y-%m-%d", Time::Location::UTC)
customer_invoice2_paid.paid = true
customer_invoice2_paid.user_id = 5
customer_invoice2_paid.payment_method_id = 2
customer_invoice2_paid.save

customer_invoice_unpaid = Invoice.new
customer_invoice_unpaid.name = "Changement Disque Dur"
customer_invoice_unpaid.amount = 140
customer_invoice_unpaid.tva = 20
customer_invoice_unpaid.date = Time.parse("2019-05-03", "%Y-%m-%d", Time::Location::UTC)
customer_invoice_unpaid.paid = false
customer_invoice_unpaid.user_id = 4
customer_invoice_unpaid.payment_method_id = 3
customer_invoice_unpaid.save

provider_invoice_paid = Invoice.new
provider_invoice_paid.name = "Achat de souris"
provider_invoice_paid.amount = 560
provider_invoice_paid.tva = 20
provider_invoice_paid.type = "C1"
provider_invoice_paid.date = Time.parse("2019-05-03", "%Y-%m-%d", Time::Location::UTC)
provider_invoice_paid.paid = true
provider_invoice_paid.user_id = 1
provider_invoice_paid.payment_method_id = 3
provider_invoice_paid.save

provider_invoice1_unpaid = Invoice.new
provider_invoice1_unpaid.name = "Achat d'écrans 32'"
provider_invoice1_unpaid.amount = 1200
provider_invoice1_unpaid.tva = 20
provider_invoice1_unpaid.type = "C1"
provider_invoice1_unpaid.date = Time.parse("2019-05-03", "%Y-%m-%d", Time::Location::UTC)
provider_invoice1_unpaid.paid = false
provider_invoice1_unpaid.user_id = 2
provider_invoice1_unpaid.payment_method_id = 3
provider_invoice1_unpaid.save

provider_invoice2_unpaid = Invoice.new
provider_invoice2_unpaid.name = "Location Voiture"
provider_invoice2_unpaid.amount = 250
provider_invoice2_unpaid.tva = 20
provider_invoice2_unpaid.type = "C2"
provider_invoice2_unpaid.date = Time.parse("2019-05-03", "%Y-%m-%d", Time::Location::UTC)
provider_invoice2_unpaid.paid = false
provider_invoice2_unpaid.user_id = 3
provider_invoice2_unpaid.payment_method_id = 3
provider_invoice2_unpaid.save
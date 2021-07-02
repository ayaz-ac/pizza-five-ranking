# frozen_string_literal: true

# rubocop:disable Metrics/MethodLength
def create_pizza(file_name, sauce)
  pizza_five_url = 'https://www.fivepizzaoriginal.com'
  csv_file = File.read("#{Rails.root}/lib/assets/#{file_name}.csv")
  csv = CSV.parse(csv_file, headers: true)
  csv.each do |row|
    Pizza.find_or_create_by(
      title: row['title'],
      composition: row['composition'],
      sauce: sauce,
      img_url: pizza_five_url + row['image-src']
    )
  end
end
# rubocop:enable Metrics/MethodLength

warn '==> Seeding Pizzas'

# Create tomatoe pizzas
create_pizza('sauce_tomate', 'tomate')

# Create creme_fraiche pizza
create_pizza('creme_fraiche', 'creme_fraiche')

# Create originale pizzas
create_pizza('sauce_originale', 'originale')

class Property < ApplicationRecord
  has_many :investments

  after_validation :geocode
  geocoded_by :address

  def calculate_price shares
    share_price = self.value / self.total_shares
    investment = shares.to_f * share_price
    trxn_fees = 0.1 * investment
    total_due = investment + trxn_fees

    {investment: investment, trxn_fees: trxn_fees, total_due: total_due}
  end

  def upload_images images
    images.each do |image|
      req = Cloudinary::Uploader.upload(image)
      self.prop_images << req["public_id"]
    end
  end

  def destroy_images
    self.prop_images.each do |image|
      Cloudinary::Uploader.destroy(image, { invalidate: true })
    end
    self.prop_images = []
  end
end

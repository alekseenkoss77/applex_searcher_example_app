class Device < ActiveRecord::Base
  validates :name, :imei, presence: true

  before_validation :check_warranty, on: :create

  private

  # callback method is example how to
  # using AppleSearcher gem.
  # Also AppleSearcher can be run in
  # background job, e.g. Sidekiq worker
  def check_warranty
    return unless imei.present?
    info = AppleSearcher::Device.find(imei)
    unless info.nil?
      self.warranty = info.warranty
      self.warranty_expired = info.expired_date
    end
  end
end

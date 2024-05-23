module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived', nil]

  included do
    before_validation :set_default_status  
    validates :status, inclusion: { in: VALID_STATUSES }

    def set_default_status
      status='public' unless status.present?
    end
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

    def archived?
      status == 'archived'
    end
  end
  
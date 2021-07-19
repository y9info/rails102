class Customer < ApplicationRecord
    belongs_to :user
    has_many :tracks, dependent: :delete_all
    validates :short_name, :origin, :level, :full_name, :linkman, :email, presence: true
    REGULAR_EMAIL = /^([A-Za-z0-9_\-\.\u4e00-\u9fa5])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,8})$/
    validates :email,format:{with: REGULAR_EMAIL, :multiline => true }

    def latest_track_title
        if self.tracks.size > 0
            self.tracks[0].title
        else
          return "零记录"
        end
    end
end

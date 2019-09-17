class Attendance < ApplicationRecord
  belongs_to :user
  #AttendanceモデルがUserモデルに対して、1対1の関連性
  
  validates :worked_on, presence: true
  #存在性の検証
  
  validates :note, length: { maximum: 50 }
  #最大文字数を50文字
  
  
  
  validate :finished_at_is_invalid_without_a_started_at
  #出勤時間存在しない場合、退勤時間は無効
  
  validate :started_at_than_finished_at_fast_if_invalid
  #出勤・退勤時間どちらも存在するとき、出勤時間より早い退勤時間は無効
  
  
  def finished_at_is_invalid_without_a_started_at
    errors.add(:started_at, "が必要です") if started_at.blank? && finished_at.present?
  end

  
  def started_at_than_finished_at_fast_if_invalid
    if started_at.present? && finished_at.present?
      errors.add(:started_at, "より早い退勤時間は無効です") if started_at > finished_at
    end
  end

end


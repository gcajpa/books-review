class BookStatus
  def self.update(user, ids)
    Book.transaction do
      user.books.where(id: ids, completed_at: nil)
        .update_all(completed_at: Time.current)

      user.books.where.not(id: ids, completed_at: nil)
        .update_all(completed_at: nil)
    end
  end
end

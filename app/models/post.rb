class Post < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :delete_all
  
  validates :title, :content, presence: true
  


  ### Ejemplos de validaciones numéricas
  # # phone
  # validates :phone, numericality: {only_integer: true}, 

  # # points
  # validates :points, numericality: {greater_than: 5}
  # validates :points, numericality: {greater_than_or_equal_to: 5}
  # validates :points, numericality: {equal_to: 5}
  # validates :points, numericality: {less_than: 5}
  # validates :points, numericality: {less_than_or_equal_to: 5}
  # validates :points, numericality: {other_than: 5}

  # def published
  #   self.published == true 
  # end

  # # Se utiliza una sintaxis especial para definir este tipo de métodos

  # scope :only_published, -> { where(published: true) } #el where es una consulta a la base de datos
  # scope :popular, -> { where("views > ?", 10) } #Suponemos un campo llamado views que cuenta la cantidad de veces que un usuario ve un artículo. SUponemos que existe el campo views:integer en posts. y llamamos los views más populares o supriores a 10



end

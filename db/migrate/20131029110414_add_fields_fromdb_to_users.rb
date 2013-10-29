class AddFieldsFromdbToUsers < ActiveRecord::Migration
  def change
    add_column :users, :date_adding_to_register, :date # дата внесения в реестр
    add_column :users, :date_entry_adding_to_register, :date # Дата обоснования внесения в реестр
    add_column :users, :number_entry_adding_from_register, :integer # Номер обоснования внесения из реестра
    add_column :users, :entry_adding_from_register, :string # Обоснование внесения в реестр
    add_column :users, :date_excluding_from_register, :date # Дата исключения из реестра
    add_column :users, :date_entry_excluding_from_register, :date # Дата обоснования исключения из реестра
    add_column :users, :number_entry_excluding_from_register, :integer # Номер обоснования исключения из реестра
    add_column :users, :entry_excluding_from_register, :string # Обоснование исключения из реестра
    add_column :users, :date_creating_of_certificate, :date # Дата выдачи удостоверения адвоката
    add_column :users, :status, :integer # Статус
    
    add_column :users, :date_adding_status, :date # Дата присвоения статуса
    add_column :users, :date_entry_adding_status, :date # Дата обоснования присвоения статуса
    add_column :users, :number_entry_adding_status, :integer # Номер присвоения статуса
    add_column :users, :date_ending_status, :date # Дата прекращения статуса
    add_column :users, :date_entry_ending_status, :date # Дата обоснования прекращения статуса
    add_column :users, :number_ending_status, :integer # Номер прекращение статуса
    add_column :users, :entry_ending_status, :string # Обоснование прекращения статуса
    
    
    add_column :users, :inn, :integer # ИНН
    add_column :users, :sps, :integer # СПС
    add_column :users, :gender, :boolean
    add_column :users, :nationality, :string # Гражданство
    add_column :users, :birthday, :date # Дата рождения
    add_column :users, :birthplace, :string # Место рождения
    add_column :users, :document, :string # Вид документа
    add_column :users, :serial_document, :string # серия
    add_column :users, :number_document, :string # номер
    add_column :users, :document_created, :date # Дата выдачи
    add_column :users, :who_created_document, :string # Кем выдан
    add_column :users, :who_created_document_code, :string # Код подразделения
    
    add_column :users, :official_address_for_contact, :string # Официальный адрес для связи
    add_column :users, :country, :string # Страна
    add_column :users, :region, :string # Округ
    add_column :users, :subdivion_russian_federation, :string # Субъект Российской Федерации
    add_column :users, :district_id, :integer # Район
    add_column :users, :index, :integer # Индекс
    add_column :users, :city, :string # Город
    add_column :users, :street, :string # Улица (проспект, переулок и др)
    add_column :users, :house_number, :string # Номер дома
    add_column :users, :house_second_number, :string # Номер корпуса
    add_column :users, :appartement_number, :string # Номер квартиры
    add_column :users, :city_punkt, :string # Населенный пункт (название)
      
    add_column :users, :home_phone, :string # Домашний телефон
    add_column :users, :work_phone, :string # Служебный телефон
    add_column :users, :fax_phone, :string # Факс
    add_column :users, :phone_2, :string # Телефон_
    add_column :users, :mobile_phone, :string # Мобильный телефон
    add_column :users, :site, :string # Сайт
    add_column :users, :post_address, :string # Почтовый адрес
    add_column :users, :additional_info, :string # Примечание
    add_column :users, :university, :string # Название ВУЗа
    add_column :users, :diplom_created, :date # Дата выдачи диплома
    add_column :users, :dimplom_serial, :string # Серия диплома
    add_column :users, :diplom_number, :integer # Номер диплома
    add_column :users, :academic_title, :string # Ученое звание
    add_column :users, :degree, :string # Ученая степень
    add_column :users, :experience, :string # Стаж
    
    
    

    
    
    
      
    
    
  end
end

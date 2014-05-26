ActiveAdmin.register Shop do

  permit_params :name, :description, :zipcode, :street_address, :zipcode, :city, :country, :price, :user_id

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  form do |f|
    f.inputs 'Details' do
      f.input :user_id
      f.input :name
      f.input :street_address
      f.input :zipcode
      f.input :city
      f.input :country, :as => :string
      f.input :description
    end
    f.actions
  end

end

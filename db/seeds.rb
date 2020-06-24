# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
             email: "admin@admin",
             password:  "123456",
             password_confirmation: "123456",)

Item.create!(

			name: 'ショートケーキ',
			description: 'ショートケーキです',
			genre_id: 'ケーキ',
			price: '1200',
			status: '販売中',
			image: open('./app/assets/images/ショートケーキ.jpg')
            )

Item.create!(
	        name: 'チョコレートケーキ',
			description: 'チョコレートケーキです',
			genre_id: 'ケーキ',
			price: '1200',
			status: '販売中',
			image: open('./app/assets/images/チョコケーキ.jpg')
            )

Item.create!(
	        name: 'モンブラン',
			description: 'モンブランです',
			genre_id: 'ケーキ',
			price: '1000',
			status: '販売中',
			image: open('./app/assets/images/モンブラン.jpg')
            )

Item.create!(
	        name: 'クッキー',
	    	description: 'クッキーです',
			genre_id: 'クッキー',
			price: '700',
			status: '販売中',
			image: open('./app/assets/images/クッキー.jpg')
			)

Item.create!(
	        name: 'プリン',
	    	description: 'プリンです。',
			genre_id: 'プリンゼリー',
			price: '600',
			status: '販売中',
			image: open('./app/assets/images/プリン.jpg')
			)

Item.create!(
	        name: 'イチゴ大福',
	    	description: '苺大福です',
	    	genre_id: '和菓子',
			price: '500',
			status: '販売中',
			image: open('./app/assets/images/苺大福.jpg')
			)

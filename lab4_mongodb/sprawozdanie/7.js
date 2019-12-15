customer_id = ObjectId()
product1_id = ObjectId()
product2_id = ObjectId()
order_id = ObjectId()

db.customer.insert({
    customer_id: customer_id,
    name: 'Tomek Zawadzki',
    address: {
        street: {
            name: 'Kawiory',
            building_no: '21'
        },
        zipCode: '31-055',
        city: 'Kraków'
    },
    verified: true,
    points: 100
})

db.product.insert({
    product_id: product1_id,
    name: 'Logitech G29 Racing Wheel',
    price: 849.00,
    available: true,
    units_on_stock: 7
})

db.product.insert({
    product_id: product2_id,
    name: 699.00,
    available: true,
    units_on_stock: 3
})

db.order.insert({
    order_id: order_id,
    customer_id: customer_id,
    items: [
        {product_id: product1_id, units: 1},
        {product_id: product2_id, units: 2},
    ],
    submitted_on: ISODate(),
    remarks: null
})

db.customer.find()
db.product.find()
db.order.find()
       
    
        
    
    
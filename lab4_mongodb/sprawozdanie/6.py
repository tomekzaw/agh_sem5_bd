import pymongo

client = pymongo.MongoClient()
db = client.TomaszZawadzki

def a():
	cities = sorted(db.business.distinct('city'))
	print('\n'.join(cities))

def b():
	print(db.review.find({
	    'date': {
		    '$gte': '2011-'
	    }
	}).count())

def c():
	cursor = db.business.find({
	    'open': False
	}, {
	    'name': 1,
	    'full_address': 1,
	    'stars': 1
	})
	for business in cursor:
		print(business)

def d():
	cursor = db.user.find({
	    '$or': [
		    {'votes.funny': 0},
		    {'votes.useful': 0}
	    ]
	}).sort('name', 1)
	for user in cursor:
		print(user)

def e():
	cursor = db.tip.aggregate([
	    {
		    '$match': {
		        'date': {
		            '$regex': '^2012-'
		        }
		    }
	    },
        {
		    '$group': {
		        '_id': '$business_id',
		        'count': {
		            '$sum': 1
		        }
	        },
	    },
        {
		    '$lookup': {
		        'from': 'business',
		        'localField': '_id',
		        'foreignField': 'business_id',
		        'as': 'business_info'
	        }
	    },
        {
		    '$unwind': '$business_info'
        },
	    {
		    '$project': {
		        'name': '$business_info.name',
		        'count': '$count'
		    }
	    },
	    {
		    '$sort': {
		         'count': 1
		    }
	    }
	])
	for business in cursor:
		print(f"{business['name']}: {business['count']}")

def f():
    cursor = db.review.aggregate([
        {
            '$match': {
                'stars': {
                    '$gte': 4.0
                }
            }
        },            
        {
            '$group': {
                '_id': '$business_id',
                'avg_stars': {
                    '$avg': '$stars'
                }
            }
        },
        {
            '$lookup': {
                'from': 'business',
                'localField': '_id',
                'foreignField': 'business_id',
                'as': 'business_info'
            }
        },
        {
            '$unwind': '$business_info'
        },
        {
            '$project': {
                'name': '$business_info.name',
                'avg_stars': '$avg_stars'
            }
        },
    ])
    for business in cursor:
        print(f"{business['name']}: {business['avg_stars']}")

def g():
    db.business.remove({'stars': 2.0})

if __name__ == '__main__':
    a()
    b()
    c()
    d()
    e()
    f()
    g()
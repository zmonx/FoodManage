const mongodb = require('mongodb');
const getDb = require('../../util/database').getDb;

class Products {
    constructor(product_name, price, id) {
        this.product_name = product_name;
        this.price = price;
        this._id = id; 
    }

    static fetchAllByCate1() {
        const db = getDb();
        return db
            .collection('products')
            .find({category_id  :1})
            .toArray()
            .then(products => {
                // console.log(products);
                return products;
            })
            .catch(err => {
                console.log(err);
            });
    }
    static fetchAllByCate2() {
        const db = getDb();
        return db
            .collection('products')
            .find({category_id  :2})
            .toArray()
            .then(products => {
                // console.log(products);
                return products;
            })
            .catch(err => {
                console.log(err);
            });
    }
    static fetchAllByCate3() {
        const db = getDb();
        return db
            .collection('products')
            .find({category_id  :3})
            .toArray()
            .then(products => {
                // console.log(products);
                return products;
            })
            .catch(err => {
                console.log(err);
            });
    }
    static fetchAllByCate4() {
        const db = getDb();
        return db
            .collection('products')
            .find({category_id  :4})
            .toArray()
            .then(products => {
                // console.log(products);
                return products;
            })
            .catch(err => {
                console.log(err);
            });
    }
    static fetchAllByCate5() {
        const db = getDb();
        return db
            .collection('products')
            .find({category_id  :5})
            .toArray()
            .then(products => {
                // console.log(products);
                return products;
            })
            .catch(err => {
                console.log(err);
            });
    }
    static fetchAllByCate6() {
        const db = getDb();
        return db
            .collection('products')
            .find({category_id  :6})
            .toArray()
            .then(products => {
                // console.log(products);
                return products;
            })
            .catch(err => {
                console.log(err);
            });
    }
    static fetchAllByCate7() {
        const db = getDb();
        return db
            .collection('products')
            .find({category_id  :7})
            .toArray()
            .then(products => {
                // console.log(products);
                return products;
            })
            .catch(err => {
                console.log(err);
            });
    }
    static fetchAllByCate8() {
        const db = getDb();
        return db
            .collection('products')
            .find({category_id  :8})
            .toArray()
            .then(products => {
                // console.log(products);
                return products;
            })
            .catch(err => {
                console.log(err);
            });
    }
}

module.exports = Products;


    // static fetchAll() {
    //     const db = getDb();
    //     return db
    //         .collection('products')
    //         .find()
    //         .toArray()
    //         .then(products => {
    //             console.log(products);
    //             return products;
    //         })
    //         .catch(err => {
    //             console.log(err);
    //         });
    // }

    // static findById(prodId) {
    //     const db = getDb();
    //     return db
    //         .collection('products')
    //         .find({ _id: new mongodb.ObjectId(prodId) })
    //         .next()
    //         .then(product => {
    //             console.log(product);
    //             return product;
    //         })
    //         .catch(err => {
    //             console.log(err);
    //         });
    // }

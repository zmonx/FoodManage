// const { validationResult } = require('express-validator')
const mongodb = require('mongodb');
// const Product = require('../models/products');
const Product = require('.././src/models/products');

const ObjectId = mongodb.ObjectId;

exports.getAllProducts = (req, res) => {
    Product.fetchAll()
        .then(products => {
            res.json({'products':products})
});
} 
exports.getAllCate1 = (req, res) => {
    Product.fetchAllByCate1()
        .then(products => {
            res.json({'products':products})
});
}
exports.getAllCate2 = (req, res) => {
    Product.fetchAllByCate2()
        .then(products => {
            res.json({'products':products})
});
}
exports.getAllCate3 = (req, res) => {
    Product.fetchAllByCate3()
        .then(products => {
            res.json({'products':products})
});
}
exports.getAllCate4 = (req, res) => {
    Product.fetchAllByCate4()
        .then(products => {
            res.json({'products':products})
});
}
exports.getAllCate5 = (req, res) => {
    Product.fetchAllByCate5()
        .then(products => {
            res.json({'products':products})
});
}
exports.getAllCate6 = (req, res) => {
    Product.fetchAllByCate6()
        .then(products => {
            res.json({'products':products})
});
}
exports.getAllCate7 = (req, res) => {
    Product.fetchAllByCate7()
        .then(products => {
            res.json({'products':products})
});
}
exports.getAllCate8 = (req, res) => {
    Product.fetchAllByCate8()
        .then(products => {
            res.json({'products':products})
});
}



// exports.getSearchProduct = (req, res, next) => {

//     Product.fetchAll()
//         .then(products => {
//             res.render('products/search', {
//                 pageTitle: 'Search Product',
//                 prods: products,
//             });
//         })
//         .catch(err => { 
//             console.log(err);
//         });
// }

// exports.test = (req, res) => {
//     res.json('what it is ?sadasdasdas');

// }

// exports.getAllCate3 = (req, res) => {
//     Product.fetchAllByCate3()
//         .then(products => {
//             res.json({'products':products})
// });
// }



// exports.getDeleteProduct = (req, res, next) => {
//     const { product_id } = req.params;
//     console.log(product_id);
//     Product.deleteById(product_id)
//         .then(() => {
//             console.log('Delete Product');
//             res.redirect('/products');
//         })
//         .catch(err => console.log(err));
// };
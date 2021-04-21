const express = require('express');

// const { check } = require('express-validator')
const router = express.Router();

const productsController = require('../../controllers/products');

router.get('/category1', productsController.getAllCate1);
router.get('/category2', productsController.getAllCate2);
router.get('/category3', productsController.getAllCate3);
router.get('/category4', productsController.getAllCate4);
router.get('/category5', productsController.getAllCate5);
router.get('/category6', productsController.getAllCate6);
router.get('/category7', productsController.getAllCate7);
router.get('/category8', productsController.getAllCate8);
router.get('/products', productsController.getAllProducts);

router.get ('/testq',(req , res) => {
    res.json("dsf sdfgysdgfhdsgfhdsgfhsdghfgdsyufgdhh fhudfgsdhjbhuiy");
});


exports.routes = router;


// /admin/add-product => GET
// router.get('/search', productsController.getSearchProduct);

// router.post('/insert', [
//     check('product_name').trim().not().isEmpty().withMessage("product name is required"),
//     check('price').isFloat({ gt: 0 }).withMessage("greater than zero")
// ], productsController.postAddProduct);

// router.post('/update', [
//     check('product_id').not().isEmpty().withMessage("empty"),
//     check('product_name').trim().isLength({ min: 1 }).withMessage("product name is required"),
//     check('price').isFloat({ gt: 0 }).withMessage("greater than zero")
// ], productsController.postUpdateProduct);

// router.get('/delete/:product_id', productsController.getDeleteProduct);

// router.get('/update/:product_id', productsController.getUpdateProduct);

// router.get('/test', productsController.test);
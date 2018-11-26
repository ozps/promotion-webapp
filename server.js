const express = require('express')
const bodyParser = require('body-parser')
const db = require('./config/dbconnect')
const app = express()
const port = process.env.PORT || 5000

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

var mysql = require('mysql')
var connection = mysql.createConnection({
    host: db.host,
    user: db.user,
    password: db.pass,
    database: db.database,
    port: db.port
})

connection.connect()

app.post('/api/check_login', (req, res) => {
    let usr = connection.escape(req.body.user)
    let pwd = connection.escape(req.body.pass)
    var sql = `SELECT COUNT(*) as Status FROM User WHERE username=${usr} AND password=${pwd}`

    // For SQL Injection Test : a' or '1=1
    // var sql = `SELECT COUNT(*) as Status FROM User WHERE username='${
    //     req.body.user
    // }' AND password='${req.body.pass}'`
    // console.log(sql)
    connection.query(sql, function(error, results) {
        if (error) throw error
        var users = JSON.parse(JSON.stringify(results[0]))
        //console.log(users.Status)
        res.contentType('application/json')
        res.send(users)
    })
})

app.post('/api/list_promotion', (req, res) => {
    var sql =
        'SELECT s.StoreName, p.PromotionName, p.PromotionType, p.PromotionDesc, p.PromotionID FROM Promotion as p left join Store as s on s.StoreID = p.StoreID'

    connection.query(sql, function(error, results, fields) {
        if (error) throw error
        var all = JSON.parse(JSON.stringify(results))
        var searchResult = []
        for (var i = 0; i < all.length; ++i) {
            var found = 0
            //console.log(typeof all[i]);
            for (var key in all[i]) {
                if (typeof all[i][key] === 'string') {
                    if (
                        all[i][key]
                            .toLowerCase()
                            .includes(req.body.text.toLowerCase())
                    ) {
                        found = 1
                        break
                    }
                }
            }
            if (found == 1) {
                searchResult.push(all[i])
            }
        }
        res.contentType('application/json')
        res.send(searchResult)
    })
})

app.post('/api/delete_promotion', (req, res) => {
    var sql = 'DELETE FROM Promotion WHERE PromotionID = ?'

    connection.query(sql, [req.body.toDelete], function(
        error,
        results,
        fields
    ) {
        if (error) throw error
        res.sendStatus(200)
    })
})

app.post('/api/get_promotion', (req, res) => {
    var sql =
        'SELECT p.*,g.GiftName,g.GiftType,g.Stock,g.Weight,d.PercentDiscount,d.ItemDiscount FROM Promotion as p LEFT OUTER JOIN Gift as g ON p.PromotionID = g.PromotionID LEFT OUTER JOIN Discount as d ON p.PromotionID = d.PromotionID WHERE p.PromotionID = ?'

    connection.query(sql, [req.body.proID], function(error, results, fields) {
        if (error) throw error
        var pro = JSON.parse(JSON.stringify(results[0]))
        res.contentType('application/json')
        res.send(pro)
    })
})

app.post('/api/delete_promotion_type', (req, res) => {
    var sql = 'DELETE FROM Discount WHERE PromotionID = ?'

    connection.query(sql, [req.body.proID], function(error, results, fields) {
        if (error) throw error
        sql = 'DELETE FROM Gift WHERE PromotionID = ?'
        connection.query(sql, [req.body.proID], function(
            error,
            results,
            fields
        ) {
            if (error) throw error
            res.sendStatus(200)
        })
    })
})

app.post('/api/edit_promotion', (req, res) => {
    var sql =
        'UPDATE Promotion SET PromotionName=?,PromotionDesc=?,PromotionType=? WHERE PromotionID = ?'

    connection.query(
        sql,
        [req.body.name, req.body.desc, req.body.type, req.body.proID],
        function(error, results, fields) {
            if (error) throw error
            res.sendStatus(200)
        }
    )
})

app.post('/api/edit_gift', (req, res) => {
    var sql =
        'UPDATE Gift SET GiftName=?,GiftType=?,Stock=?,Weight=? WHERE PromotionID = ?'

    connection.query(
        sql,
        [
            req.body.name,
            req.body.type,
            req.body.stock,
            req.body.weight,
            req.body.proID
        ],
        function(error, results, fields) {
            if (error) throw error
            res.sendStatus(200)
        }
    )
})

app.post('/api/edit_discount', (req, res) => {
    var sql =
        'UPDATE Discount SET PercentDiscount=?,ItemDiscount=? WHERE PromotionID = ?'

    connection.query(
        sql,
        [req.body.percent, req.body.itemm, req.body.proID],
        function(error, results, fields) {
            if (error) throw error
            res.sendStatus(200)
        }
    )
})

app.post('/api/add_detail', (req, res) => {
    if (req.body['new_type'] === 'Discount') {
        var sql = 'INSERT INTO Discount VALUES(?,?,?)'

        connection.query(
            sql,
            [
                req.body.ID,
                req.body['discount_percent'],
                req.body['discount_item']
            ],
            function(error, results, fields) {
                if (error) throw error
                res.sendStatus(200)
            }
        )
    } else if (req.body['new_type'] === 'Gift') {
        var sql = 'INSERT INTO Gift VALUES(?,?,?,?,?)'

        connection.query(
            sql,
            [
                req.body.ID,
                req.body['gift_name'],
                req.body['gift_type'],
                req.body['gift_stock'],
                req.body['gift_weight']
            ],
            function(error, results, fields) {
                if (error) throw error
                res.sendStatus(200)
            }
        )
    }
})

app.get('/api/list_store', (req, res) => {
    var sql = 'SELECT s.StoreID, s.StoreName FROM Store as s'

    connection.query(sql, function(error, results, fields) {
        if (error) throw error
        var all = JSON.parse(JSON.stringify(results))
        var searchResult = []
        for (var i = 0; i < all.length; ++i) {
            let obj = {}
            obj['storeID'] = all[i]['StoreID']
            obj['storeString'] =
                'ID ' + all[i]['StoreID'] + ' : ' + all[i]['StoreName']
            searchResult.push(obj)
        }
        res.contentType('application/json')
        res.send(searchResult)
    })
})

app.post('/api/create_promotion', (req, res) => {
    var sql = 'INSERT INTO Promotion VALUES(NULL,?,?,?,?)'

    connection.query(
        sql,
        [
            req.body['storeID'],
            req.body['name'],
            req.body['desc'],
            req.body['type']
        ],
        function(error, results, fields) {
            if (error) throw error
            sql = 'SELECT LAST_INSERT_ID() as idx;'

            connection.query(sql, function(error, results, fields) {
                if (error) throw error
                if (req.body['type'] === 'Discount') {
                    sql = 'INSERT INTO Discount VALUES(?,?,?)'

                    connection.query(
                        sql,
                        [
                            results[0].idx,
                            req.body['discount_percent'],
                            req.body['discount_item']
                        ],
                        function(error, results, fields) {
                            if (error) throw error
                            res.sendStatus(200)
                        }
                    )
                } else if (req.body['type'] === 'Gift') {
                    sql = 'INSERT INTO Gift VALUES(?,?,?,?,?)'

                    connection.query(
                        sql,
                        [
                            results[0].idx,
                            req.body['gift_name'],
                            req.body['gift_type'],
                            req.body['gift_stock'],
                            req.body['gift_weight']
                        ],
                        function(error, results, fields) {
                            if (error) throw error
                            res.sendStatus(200)
                        }
                    )
                }
            })
        }
    )
})

app.listen(port, () => console.log(`Listening on port ${port}`))

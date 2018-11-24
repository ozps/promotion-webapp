## Scripts

In the project directory, you can run:

### `npm run dev`

To start Promotion-Webapp

You need to :

1.  create mySQL Database using dbproject.sql in config folder.
2.  create user who can access database.
3.  create Table User which consists of user records(username and password).

    <table>
        <tr>
            <th>username</th>
            <th>password</th> 
        </tr>
        <tr>
            <td>admin</td>
            <td>xxxx</td> 
        </tr>
    </table>

4.  create dbconnect.js in config folder.
    <br />
    Example
    module.exports = {
    host: 'localhost',
    user: 'username',
    pass: 'password',
    database: 'dbname',
    port: '8889'
    }
    
 5.  npm install at project path and client folder.
 6.  npm install -g yarn
 7.  Finally, type "npm run dev" at project path to start app.

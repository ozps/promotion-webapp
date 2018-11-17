import React from 'react'
import ReactDOM from 'react-dom'
import { BrowserRouter, Route, Switch } from 'react-router-dom'
import './index.css'
import Main from './components/Main.js'
import Manage from './components/Manage.js'
import Create from './components/Create.js'
import Edit from './components/Edit.js'
import Login from './components/Login.js'
import * as serviceWorker from './serviceWorker'

ReactDOM.render(
    <BrowserRouter>
        <div>
            <Switch>
                <Route path="/edit" component={Edit} />
                <Route path="/create" component={Create} />
                <Route path="/manage" component={Manage} />
                <Route path="/main" component={Main} />
                <Route path="/" component={Login} />
            </Switch>
        </div>
    </BrowserRouter>,
    document.getElementById('root')
)

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: http://bit.ly/CRA-PWA
serviceWorker.unregister()

import React, { Component } from 'react'
import Header from './Header'

class Main extends Component {
    constructor(props) {
        super(props)
        this.state = {
            query: '',
            promotion: []
        }
    }
    componentDidMount() {
        if (localStorage.checkSession === '1') this.sendQuery()
    }
    sendQuery = async () => {
        let temp = await document.querySelector('input').value
        const response = await fetch('/api/list_promotion', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ text: temp })
        })
        const results = await response.json()
        this.setState({ query: temp, promotion: results })
    }
    renderPromotion = () => {
        if (this.state.promotion !== []) {
            return this.state.promotion.map(x => {
                return (
                    <tr key={x.PromotionID}>
                        <td>{x.StoreName}</td>
                        <td>{x.PromotionType ? x.PromotionType : '-'}</td>
                        <td>{x.PromotionDesc}</td>
                    </tr>
                )
            })
        }
    }
    render() {
        return localStorage.checkSession === '1' ? (
            <React.Fragment>
                <Header isHidden={false} />
                <div className="container" id="main-dashboard">
                    <a
                        href="/create"
                        className="btn btn-outline-primary btn-lg main-button"
                        role="button"
                        aria-pressed="true"
                    >
                        Create Promotions
                    </a>
                    <a
                        href="/manage"
                        className="btn btn-outline-primary btn-lg main-button"
                        role="button"
                        aria-pressed="true"
                    >
                        Manage Promotions
                    </a>
                </div>
                <div
                    align="center"
                    className="input-group mb-3"
                    id="main-query"
                >
                    <input
                        type="text"
                        className="form-control" // Cant apply CSS
                        placeholder="Query"
                        aria-describedby="button-addon2"
                        style={{ maxWidth: 600 }}
                        onKeyUp={e => {
                            if (e.key === 'Enter') {
                                this.sendQuery()
                            }
                        }}
                    />
                    <div className="input-group-append">
                        <button
                            className="btn btn-outline-secondary"
                            type="button"
                            id="button-addon2"
                            onClick={() => this.sendQuery()}
                        >
                            Search
                        </button>
                    </div>
                </div>
                {this.state.promotion.length !== 0 && (
                    <div className="container">
                        <table className="table table-hover table-bordered">
                            <thead>
                                <tr>
                                    <th style={{ textAlign: 'center' }}>
                                        Store Name
                                    </th>
                                    <th style={{ textAlign: 'center' }}>
                                        Type
                                    </th>
                                    <th style={{ textAlign: 'center' }}>
                                        Promotion
                                    </th>
                                </tr>
                            </thead>
                            <tbody>{this.renderPromotion()}</tbody>
                        </table>
                    </div>
                )}
            </React.Fragment>
        ) : (
            <h1 className="container">Please Login</h1>
        )
    }
}

export default Main

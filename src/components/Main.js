import React, { Component } from 'react'
import Header from './Header'

class Main extends Component {
    constructor(props) {
        super(props)
        this.state = {
            query: '',
            promotion: [
                { name: 'Store1', type: 'Reward', desc: 'Desc1' },
                { name: 'Store2', type: 'Reward', desc: 'Desc2' }
            ]
        }
    }
    sendQuery = async () => {
        let temp = document.querySelector('input').value
        if (temp !== '') {
            await this.setState({
                query: temp
                // promotion: [{ name: 'Store5', type: 'Reward', desc: 'Desc5' }]
            })
            // fetchQuery
            document.querySelector('input').value = ''
        }
        console.log(this.state.query)
    }
    renderPromotion = () => {
        if (this.state.promotion !== []) {
            return this.state.promotion.map(x => {
                return (
                    <tr key={x.name}>
                        <td>{x.name}</td>
                        <td>{x.type}</td>
                        <td>{x.desc}</td>
                    </tr>
                )
            })
        }
    }
    render() {
        return (
            <React.Fragment>
                <Header isHidden={true} />
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
                <div className="container">
                    <table className="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th style={{ textAlign: 'center' }}>
                                    Store Name
                                </th>
                                <th style={{ textAlign: 'center' }}>Type</th>
                                <th style={{ textAlign: 'center' }}>
                                    Promotion
                                </th>
                            </tr>
                        </thead>
                        <tbody>{this.renderPromotion()}</tbody>
                    </table>
                </div>
            </React.Fragment>
        )
    }
}

export default Main

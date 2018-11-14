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
    sendQuery = async () => {
        let temp = document.querySelector('input').value
        if (temp !== '') {
            await this.setState({
                query: temp
            })
            // fetchQuery
            document.querySelector('input').value = ''
        }
        console.log(this.state.query)
    }
    renderPromotion = () => {
        // View results format
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
                <div className="input-group mb-3" id="main-query">
                    <input
                        type="text"
                        className="form-control" // Cant apply CSS
                        placeholder="Query"
                        aria-label="Query"
                        aria-describedby="button-addon2"
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
                <ul className="list-group">{this.renderPromotion()}</ul>
            </React.Fragment>
        )
    }
}

export default Main

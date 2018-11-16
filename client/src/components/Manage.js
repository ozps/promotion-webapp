import React, { Component } from 'react'
import Header from './Header'

class Manage extends Component {
    constructor(props) {
        super(props)
        this.state = {
            promotion: []
        }
        // console.log(this.state.promotion.length)
    }
    componentDidMount() {
        this.getProList()
    }
    getProList = async () => {
        const response = await fetch('/api/list_promotion', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ text: '' })
        })
        const results = await response.json()
        await this.setState({ promotion: results })
    }
    sendDeleteReq = async proID => {
        const response = await fetch('/api/delete_promotion', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ toDelete: proID })
        })
    }
    renderPromotion = () => {
        if (this.state.promotion.length !== 0) {
            return this.state.promotion.map(x => {
                return (
                    <tr key={x.StoreName + ' ' + x.PromotionID}>
                        <td>{x.StoreName}</td>
                        <td>{x.PromotionType ? x.PromotionType : '-'}</td>
                        <td>{x.PromotionDesc}</td>
                        <td style={{ textAlign: 'center' }}>
                            <button
                                type="button"
                                className="btn btn-outline-success btn-sm"
                                style={{ width: 80 }}
                                onClick={e => {
                                    localStorage.editProID = x.PromotionID
                                    this.props.history.push('/edit')
                                }}
                            >
                                Edit
                            </button>
                            <button
                                type="button"
                                className="btn btn-outline-danger btn-sm"
                                style={{ width: 80 }}
                                onClick={() => {
                                    this.sendDeleteReq(x.PromotionID)
                                    this.getProList()
                                }}
                            >
                                Delete
                            </button>
                        </td>
                    </tr>
                )
            })
        }
    }
    render() {
        return (
            <React.Fragment>
                <Header isHidden={false} path={'/'} />
                <h1 style={{ margin: 30 }}>List of all promotions</h1>
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
                                    <th style={{ textAlign: 'center' }}>
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>{this.renderPromotion()}</tbody>
                        </table>
                    </div>
                )}
            </React.Fragment>
        )
    }
}

export default Manage

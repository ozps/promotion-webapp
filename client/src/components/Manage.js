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
        if (localStorage.checkSession === '1') this.getProList()
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
        // console.log(this.state.promotion)
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
                                    this.props.history.push({
                                        pathname: '/edit',
                                        state: {
                                            storeName: x.StoreName,
                                            promotionName: x.PromotionName,
                                            promotionDesc: x.PromotionDesc
                                        }
                                    })
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
        //console.log(localStorage.checkSession)
        return localStorage.checkSession === '1' ? (
            <React.Fragment>
                <Header isHidden={false} />
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
        ) : (
            <h1 className="container">Please Login</h1>
        )
    }
}

export default Manage

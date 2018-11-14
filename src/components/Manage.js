import React, { Component } from 'react'
import Header from './Header'

class Manage extends Component {
    constructor(props) {
        super(props)
        this.state = {
            promotion: [
                { id: '1', name: 'Store1', type: 'Reward', desc: 'Desc1' },
                { id: '2', name: 'Store2', type: 'Reward', desc: 'Desc2' }
            ]
        }
    }
    componentDidMount() {
        // fetchData & setState
    }
    renderPromotion = () => {
        if (this.state.promotion !== []) {
            return this.state.promotion.map(x => {
                return (
                    <tr key={x.name}>
                        <td>{x.name}</td>
                        <td>{x.type}</td>
                        <td>{x.desc}</td>
                        <td style={{ textAlign: 'center' }}>
                            <button
                                type="button"
                                class="btn btn-outline-success btn-sm"
                                style={{ width: 80 }}
                            >
                                Edit
                            </button>
                            <button
                                type="button"
                                class="btn btn-outline-danger btn-sm"
                                style={{ width: 80 }}
                                onClick={() => {
                                    // Send delete to server & Fetch data and setState
                                    this.setState({
                                        promotion: [
                                            {
                                                id: '7',
                                                name: 'Store7',
                                                type: 'Reward',
                                                desc: 'Desc7'
                                            }
                                        ]
                                    })
                                }}
                            >
                                Danger
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
                <div class="container">
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
                                <th style={{ textAlign: 'center' }}>Action</th>
                            </tr>
                        </thead>
                        <tbody>{this.renderPromotion()}</tbody>
                    </table>
                </div>
            </React.Fragment>
        )
    }
}

export default Manage

import React, { Component } from 'react'
import Header from './Header'

class Create extends Component {
    constructor(props) {
        super(props)
        this.state = {
            storeList: [],
            name: '',
            desc: '',
            type: '',
            discount_item: '',
            discount_percent: '',
            gift_name: '',
            gift_weight: '',
            gift_stock: '',
            gift_type: '',
            storeID: -1
        }
    }
    componentDidMount() {
        if (localStorage.checkSession === '1') this.updateStoreList()
    }
    updateStoreList = async () => {
        const response = await fetch('/api/list_store', {
            method: 'GET',
            headers: {
                'Content-Type': 'application/json'
            }
        })
        const results = await response.json()
        await this.setState({ storeList: results })
        if (this.option1.childNodes[0].attributes['storeid'])
            this.setState({
                storeID: this.option1.childNodes[0].attributes['storeid'].value
            })
    }
    sendCreate = e => {
        e.preventDefault()
        if (this.state.name !== '' && this.state.desc !== '') {
            fetch('/api/create_promotion', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(this.state)
            })
            this.props.history.push('/main')
        }
    }
    storeChanged = e => {
        var index = e.target.selectedIndex
        var optionElement = e.target.childNodes[index]
        this.setState({ storeID: optionElement.getAttribute('storeid') })
    }
    renderStoreList = () => {
        if (this.state.storeList !== []) {
            return this.state.storeList.map(x => {
                let stname = x.storeString.slice(x.storeString.indexOf(':') + 1)
                return (
                    <option key={x.storeString} storeid={x.storeID}>
                        {stname}
                    </option>
                )
            })
        }
    }
    render() {
        return localStorage.checkSession === '1' ? (
            <React.Fragment>
                <Header isHidden={false} />
                <h1 className="form-title">
                    <span class="badge badge-light ">Create Promotion</span>
                </h1>
                <form className="form-container">
                    <div className="form-group">
                        <label>
                            <strong>Store</strong>
                        </label>
                        <select
                            ref={ref => (this.option1 = ref)}
                            className="form-control"
                            style={{ maxWidth: 600 }}
                            onChange={e => {
                                this.storeChanged(e)
                            }}
                        >
                            {this.renderStoreList()}
                        </select>
                    </div>
                    <div className="form-group">
                        <label>
                            <strong>Promotion Name</strong>
                        </label>
                        <input
                            type="text"
                            className="form-control"
                            placeholder="Name"
                            style={{ maxWidth: 600 }}
                            onChange={e => {
                                this.setState({ name: e.target.value })
                            }}
                        />
                    </div>
                    <div className="form-group">
                        <label>
                            <strong>Promotion Description</strong>
                        </label>
                        <input
                            type="text"
                            className="form-control"
                            placeholder="Description"
                            style={{ maxWidth: 600 }}
                            onChange={e => {
                                this.setState({ desc: e.target.value })
                            }}
                        />
                    </div>
                    <div className="form-check form-check-inline">
                        <input
                            className="form-check-input"
                            type="radio"
                            name="inlineRadioOptions"
                            value="Discount"
                            onClick={() => this.setState({ type: 'Discount' })}
                        />
                        <label className="form-check-label">
                            <strong>Discount</strong>
                        </label>
                    </div>
                    <div className="form-check form-check-inline">
                        <input
                            className="form-check-input"
                            type="radio"
                            name="inlineRadioOptions"
                            value="Gift"
                            onClick={() => this.setState({ type: 'Gift' })}
                        />
                        <label className="form-check-label">
                            <strong>Gift</strong>
                        </label>
                    </div>
                    <div className="form-check form-check-inline">
                        <input
                            className="form-check-input"
                            type="radio"
                            name="inlineRadioOptions"
                            value="None"
                            onClick={() => this.setState({ type: '' })}
                        />
                        <label className="form-check-label">
                            <strong>None</strong>
                        </label>
                    </div>
                    <div className="form-group form-check">
                        {this.state.type === 'Discount' && (
                            <div className="form-group form-sub">
                                <div className="form-group">
                                    <label>
                                        <strong>Item Discount</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Item"
                                        style={{ maxWidth: 300 }}
                                        onChange={e => {
                                            this.setState({
                                                discount_item: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                                <div className="form-group">
                                    <label>
                                        <strong>Percent Discount (%)</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Discount"
                                        style={{ maxWidth: 300 }}
                                        onChange={e => {
                                            this.setState({
                                                discount_percent: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                            </div>
                        )}
                        {this.state.type === 'Gift' && (
                            <div className="form-group form-sub">
                                <div className="form-group">
                                    <label>
                                        <strong>Gift Name</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Name"
                                        style={{ maxWidth: 300 }}
                                        onChange={e => {
                                            this.setState({
                                                gift_name: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                                <div className="form-group">
                                    <label>
                                        <strong>Type</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Type"
                                        style={{ maxWidth: 300 }}
                                        onChange={e => {
                                            this.setState({
                                                gift_type: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                                <div className="form-group">
                                    <label>
                                        <strong>Weight (Grams)</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Weight"
                                        style={{ maxWidth: 300 }}
                                        onChange={e => {
                                            this.setState({
                                                gift_weight: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                                <div className="form-group">
                                    <label>
                                        <strong>Stock (Items)</strong>
                                    </label>
                                    <input
                                        type="text"
                                        className="form-control"
                                        placeholder="Stock"
                                        style={{ maxWidth: 300 }}
                                        onChange={e => {
                                            this.setState({
                                                gift_stock: e.target.value
                                            })
                                        }}
                                    />
                                </div>
                            </div>
                        )}
                    </div>
                    <button
                        type="submit"
                        className="btn btn-primary"
                        onClick={e => {
                            this.sendCreate(e)
                        }}
                    >
                        Create
                    </button>
                </form>
            </React.Fragment>
        ) : (
            <h1 className="container">Please Login</h1>
        )
    }
}

export default Create

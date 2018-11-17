import React from 'react'

const Header = ({ isHidden }) => {
    return (
        <nav className="navbar navbar-expand-lg navbar-dark bg-dark">
            {localStorage.checkSession === '1' ? (
                <a className="navbar-brand" href="/main">
                    <strong>Half Night Miracle</strong>
                </a>
            ) : (
                <span className="navbar-brand" href="/main">
                    <strong>Half Night Miracle</strong>
                </span>
            )}

            <span className="navbar-nav mr-auto" />
            {!isHidden && (
                <a
                    href="/"
                    className="btn btn-secondary btn-lg active btn-sm"
                    role="button"
                    aria-pressed="true"
                    onClick={() => {
                        localStorage.checkSession = 0
                    }}
                >
                    Logout
                </a>
            )}
        </nav>
    )
}

export default Header

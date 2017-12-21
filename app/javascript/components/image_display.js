import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"

class ImageDisplay extends React.Component {


  render () {
    return (
      <div className="">
        <img className="card-img-top" style={{width: 80 + '%', height: 'auto', 'paddingTop': 10 +'px', 'max-height': 400 +'px'}} src={this.props.image} />
      </div>
    );
  }
}


export default ImageDisplay

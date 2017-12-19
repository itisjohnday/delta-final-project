import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"
import puppy1 from './images/puppy1.jpeg';
import puppy2 from './images/puppy2.jpg';
import 'src/match_frame'

class MatchDisplay extends React.Component {


  render () {
    // console.log(this.props.popup_data)
    return (
      <div className="match">

      <h4 className ="header_vote"> Click to vote on the best!  </h4> 
        <div className="grid-container">
          <div className="one"> <p className="puppyname1"> <strong> Sam </strong> </p> <img src={puppy1} className="puppy1" alt="" /> <p className="vote1"> <strong> <a href="url">vote</a> </strong> </p> </div>
          <div className="two"> <strong> <p className="vs" > VS </p> </strong> </div>
          <div className="three"> <p className="vote1"> <strong> <a href="url">vote</a> </strong> </p> <img src={puppy2} className="puppy2"  alt="" /> <p className="puppyname2"> <strong> Grandpa </strong> </p></div>
        </div>

      </div>
    );
  }
}


export default MatchDisplay

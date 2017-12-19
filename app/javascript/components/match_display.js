import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"
import puppy1 from './images/puppy1.jpeg';
import puppy2 from './images/puppy2.jpg';
import 'src/match_frame'

class MatchDisplay extends React.Component {


  render () {
    return (
      <div className="match">

      <h4 class ="header_vote"> Click to vote on the best!  </h4> 
        <div class="grid-container">
          <div class="one"> <p class="puppyname1"> <strong> Sam </strong> </p> <img src={puppy1} className="puppy1" alt="" /> <p class="vote1"> <strong> <a href="url">vote</a> </strong> </p> </div>
          <div class="two"> <strong> <p className="vs" > VS </p> </strong> </div>
          <div class="three"> <p class="vote1"> <strong> <a href="url">vote</a> </strong> </p> <img src={puppy2} className="puppy2"  alt="" /> <p class="puppyname2"> <strong> Grandpa </strong> </p></div>
        </div>

      </div>
    );
  }
}


export default MatchDisplay

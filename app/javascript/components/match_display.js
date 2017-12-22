import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"
import puppy1 from './images/puppy1.jpeg';
import puppy2 from './images/puppy2.jpg';
import 'src/match_display'

class MatchDisplay extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      contestant_1: this.props.popup_data['contestant_1'],
      contestant_1_entry_id: this.props.popup_data['contestant_1_entry_id'],
      contestant_1_entry_pic: this.props.popup_data['contestant_1_entry_pic'],
      contestant_1_prof_pic: this.props.popup_data['contestant_1_prof_pic'],
      contestant_2: this.props.popup_data['contestant_2'],
      contestant_2_entry_id: this.props.popup_data['contestant_2_entry_id'],
      contestant_2_entry_pic: this.props.popup_data['contestant_2_entry_pic'],
      contestant_2_prof_pic: this.props.popup_data['contestant_2_prof_pic']
    };
  }

  sendResult(entry_id, pts) {
  // console.log(JSON.stringify({entry: this.state.links[0].entry_id, vote: pts}))
  fetch('http://localhost:3000/vote_reg', {
    method: 'POST',
    credentials: 'include',
    headers: {
      'Content-Type': 'application/json',
      'X-CSRF-TOKEN': this.props.auth_token
    },
    body: JSON.stringify({entry: entry_id, vote: pts})
  }).then((response) => {
    console.log(response);
  })

  }

  vote(event, entry_id){
    event.preventDefault()
    // console.log(this.props.auth_token)
    this.sendResult(entry_id, 1)
    this.props.popup_state()

  }

  render () {

    // console.log(this.props.popup_data['contestant_1_prof_pic: '])
    return (
      <div className="match">
        <h4 className ="header_vote"> Click to vote on the best!  
        </h4>
          <div className="container-fluid">

            <div className="row justify-content-start">
              <div className="col-4">
                <div className="row justify-content-center">
                    <strong> {this.state.contestant_1} </strong>
                </div>
                <div className="row justify-content-center">
                  <img className="puppy2" src={this.state.contestant_1_entry_pic} alt="" />
                </div>
                <strong> <a className="row justify-content-center" href="url" onClick={(e)=>{this.vote(e, this.state.contestant_1_entry_id)}}>vote</a> 
                </strong>
              </div>
            </div>

            <div className="row justify-content-center">
              <div className="col-2">
                <strong> <p className="vs" > VS </p> </strong>
              </div>
            </div>

            <div className="row justify-content-end">
              <div className="col-4">
                <div className="row justify-content-center">
                    <strong> {this.state.contestant_2} </strong>
                </div>
                <div className="row justify-content-center">
                  <img className="puppy2" src={this.state.contestant_2_entry_pic} alt="" />
                </div>
                <strong> <a className="row justify-content-center" href="url" onClick={(e)=>{this.vote(e, this.state.contestant_2_entry_id)}}>vote</a> 
                </strong>
              </div>
            </div>

         </div>
      </div>
    );
  }
}


export default MatchDisplay

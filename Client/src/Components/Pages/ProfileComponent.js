import React from "react";
import "../../CSS/ProfileCSS.css";
import NavbarComponent from "./NavbarComponent";
import PersonDescryptionComponent from "../ProfileComponents/PersonDescryptionComponent";

function ProfileComponent() {
 

  return (
    <>
      <NavbarComponent />
      <div className="profile-container">
        <div className="person-description">
          <PersonDescryptionComponent/>
        </div>
      </div>
    </>
  );
}

export default ProfileComponent;



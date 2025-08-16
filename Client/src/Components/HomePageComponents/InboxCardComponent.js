import '../../CSS/InboxCardComponentCSS.css';
import { IoMdMail } from "react-icons/io";

function InboxCardComponent(){
    const emails = [
        {name : 'Ashley Gabes',time:'09:30',text:'hii here are my english notes from last class',img:'/images/Ashley.png'},
        {name : 'Lisa Smith',time:'06:30',text:'are you coming over today to study for our finals? let me know xx',img:'/images/Lisa.png'},
        {name : 'Dan Levi',time:'010:30',text:'here are my math notes. send me yours?',img:'/images/Dan.jpg'}
    ]
        
    

    return(
    <>
        <div className='inbox-card'>
            <div className="inbox-card-header">
                <IoMdMail/>
                <p>Just template for now</p>
            </div>
            {/* <div className="inbox-card-body">
                {
                    emails.map((item) => (
                        <div className="inbox-card-body-item">
                            <img className='inbox-card-body-item-img' src={process.env.PUBLIC_URL + item.img} alt="profile-pic" />
                            <div className='inbox-card-body-item-body'>
                                <div className='inbox-card-body-item-title'>
                                    <p className="inbox-card-body-item-name">
                                        {item.name}
                                    </p>
                                    <p className="inbox-card-body-item-time">
                                        {item.time}
                                    </p>
                                </div>
                                <p className="inbox-card-body-item-text">
                                    {item.text}
                                </p>
                            </div> 
                        </div>  
                    ))
                }
            </div> */}
        </div>
    </>
    )
         
}
export default InboxCardComponent;
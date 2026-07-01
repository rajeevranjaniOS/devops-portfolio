/*==================================================
    DevOps Portfolio Website
    app.js
==================================================*/


/*=========================================
AOS Animation
=========================================*/

AOS.init({

    duration:1000,
    once:true,
    offset:120

});


/*=========================================
Typing Animation
=========================================*/

new Typed("#typing",{

    strings:[

        "Senior DevOps Engineer",
        "Site Reliability Engineer",
        "Cloud Engineer",
        "Kubernetes Engineer",
        "Terraform Specialist",
        "AWS & GCP Engineer"

    ],

    typeSpeed:60,

    backSpeed:35,

    backDelay:1800,

    loop:true

});


/*=========================================
Sticky Header Shadow
=========================================*/

const header=document.querySelector("header");

window.addEventListener("scroll",()=>{

    if(window.scrollY>50){

        header.style.boxShadow="0 10px 35px rgba(0,0,0,.35)";
        header.style.background="rgba(15,23,42,.92)";

    }

    else{

        header.style.boxShadow="none";
        header.style.background="rgba(15,23,42,.85)";

    }

});


/*=========================================
Scroll To Top Button
=========================================*/

const scrollBtn=document.getElementById("scrollTop");

window.addEventListener("scroll",()=>{

    if(window.pageYOffset>300){

        scrollBtn.style.display="flex";

    }

    else{

        scrollBtn.style.display="none";

    }

});


scrollBtn.addEventListener("click",()=>{

    window.scrollTo({

        top:0,

        behavior:"smooth"

    });

});


/*=========================================
Highlight Active Navigation
=========================================*/

const sections=document.querySelectorAll("section");

const navLinks=document.querySelectorAll(".nav-links a");


window.addEventListener("scroll",()=>{

    let current="";

    sections.forEach(section=>{

        const sectionTop=section.offsetTop-120;

        if(pageYOffset>=sectionTop){

            current=section.getAttribute("id");

        }

    });

    navLinks.forEach(link=>{

        link.classList.remove("active");

        if(link.getAttribute("href")==="#"+current){

            link.classList.add("active");

        }

    });

});


/*=========================================
Smooth Navigation
=========================================*/

document.querySelectorAll('a[href^="#"]').forEach(anchor=>{

    anchor.addEventListener("click",function(e){

        e.preventDefault();

        const target=document.querySelector(this.getAttribute("href"));

        target.scrollIntoView({

            behavior:"smooth"

        });

    });

});


/*=========================================
Reveal Cards One By One
=========================================*/

const cards=document.querySelectorAll(

".skill-card,.project-card,.cert-card,.timeline-content"

);

const observer=new IntersectionObserver(entries=>{

    entries.forEach(entry=>{

        if(entry.isIntersecting){

            entry.target.classList.add("show");

        }

    });

},{

    threshold:.2

});

cards.forEach(card=>{

    observer.observe(card);

});


/*=========================================
Current Year in Footer
=========================================*/

const year=document.querySelector("#year");

if(year){

    year.textContent=new Date().getFullYear();

}


/*=========================================
Console Welcome Message
=========================================*/

console.log("%c👋 Welcome to Rajeev's DevOps Portfolio",

"font-size:20px;color:#3B82F6;font-weight:bold;");

console.log("%cBuilt with HTML, CSS & JavaScript",

"font-size:15px;color:#22C55E;");


/*=========================================
Preloader (Future Ready)
=========================================*/

window.addEventListener("load",()=>{

    document.body.classList.add("loaded");

});


/*=========================================
Disable Right Click (Optional)
Comment if not required
=========================================*/

// document.addEventListener("contextmenu",(e)=>{

// e.preventDefault();

// });


/*=========================================
Navbar Active Class Styling
=========================================*/

document.querySelectorAll(".nav-links a").forEach(link=>{

    link.addEventListener("click",function(){

        document.querySelectorAll(".nav-links a")

        .forEach(nav=>nav.classList.remove("active"));

        this.classList.add("active");

    });

});


/*=========================================
Simple Fade Effect on Hero Image
=========================================*/

const heroImage=document.querySelector(".hero-right img");

if(heroImage){

window.addEventListener("mousemove",(e)=>{

let x=(window.innerWidth/2-e.pageX)/40;

let y=(window.innerHeight/2-e.pageY)/40;

heroImage.style.transform=

`translate(${x}px,${y}px)`;

});

}


/*=========================================
Project Card Tilt Effect
=========================================*/

const projectCards=document.querySelectorAll(".project-card");

projectCards.forEach(card=>{

card.addEventListener("mousemove",(e)=>{

const rect=card.getBoundingClientRect();

const x=e.clientX-rect.left;

const y=e.clientY-rect.top;

const rotateX=((y-rect.height/2)/20);

const rotateY=((rect.width/2-x)/20);

card.style.transform=

`rotateX(${rotateX}deg)

rotateY(${rotateY}deg)

translateY(-10px)`;

});

card.addEventListener("mouseleave",()=>{

card.style.transform="translateY(0)";

});

});


/*=========================================
Loading Finished
=========================================*/

console.log("Portfolio Loaded Successfully.");
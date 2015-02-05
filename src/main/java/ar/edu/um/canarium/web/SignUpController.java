package ar.edu.um.canarium.web;

import java.util.Date;
import java.util.Random;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import net.tanesha.recaptcha.ReCaptcha;
import net.tanesha.recaptcha.ReCaptchaFactory;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.authentication.encoding.MessageDigestPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ar.edu.um.canarium.domain.Persona;
import ar.edu.um.canarium.domain.Role;
import ar.edu.um.canarium.domain.Sexo;
import ar.edu.um.canarium.domain.User;
import ar.edu.um.canarium.domain.UserRole;
import ar.edu.um.canarium.servicio.Servicio;

@RequestMapping("/signup/**")
@Controller
public class SignUpController {

    @Autowired
    private SignUpValidator validator;

    @Autowired
    private transient MailSender mailSender;

    private transient SimpleMailMessage simpleMailMessage;

	@Autowired
	private MessageDigestPasswordEncoder messageDigestPasswordEncoder;

    @ModelAttribute("User")
    public UserRegistrationForm formBackingObject() {
        return new UserRegistrationForm();
    }

    @RequestMapping(params = "form", method = RequestMethod.GET, produces = "text/html")
    public String createForm(Model model) {
    	UserRegistrationForm form = new UserRegistrationForm();
        model.addAttribute("User", form);
        model.addAttribute("captcha_form",form.getReCaptchaHtml());
        return "signup/index";
    }
    
    @RequestMapping(params = "activate", method = RequestMethod.GET, produces = "text/html")
    public String activateUser(@RequestParam(value = "activate", required = true) String activationKey,@RequestParam(value = "emailAddress", required = true) String emailAddress,Model model) {
        TypedQuery<User> query = User.findUsersByActivationKeyAndEmailAddress(activationKey, emailAddress);
        User User=query.getSingleResult();
        if(null!=User){
        	User.setActivationDate(new Date());
        	User.setEnabled(true);
        	User.merge();
        	return "login";
        }
        else{
        	return "signup/error";
        }

    }

    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid UserRegistrationForm userRegistration, BindingResult result, Model model, HttpServletRequest request) {
        validator.validate(userRegistration, result);
        if (result.hasErrors()) {
        	
            return createForm(model);
        } else {
            Random random = new Random(System.currentTimeMillis());
            String activationKey = "activationKey:" + random.nextInt();

            User User = new User();
            User.setActivationDate(null);
            User.setEmailAddress(userRegistration.getEmailAddress());
            User.setFirstName(userRegistration.getFirstName());
            User.setLastName(userRegistration.getLastName());
            User.setPassword(messageDigestPasswordEncoder.encodePassword(userRegistration.getPassword(), null));
            User.setActivationKey(activationKey);
            User.setEnabled(false);
            User.setLocked(false);
            User.persist();
            
            /*Asigno el rol por defecto a user*/
            UserRole Urol = new Servicio().setAsignarRol(User);
            Urol.persist();
            
            /*CREA LA PERSONA*/
            Persona persona = new Servicio().setPersonaUsuario(User);
            persona.persist();

            SimpleMailMessage mail = new SimpleMailMessage();
    		mail.setTo(User.getEmailAddress());
    		mail.setSubject("Activacion de usuario");
    		
    		mail.setText("Bienvenido a CanariUM  "+User.getFirstName()+" "+User.getLastName()+"\n. Para completar el registro, por favor haga clic sobre el siguiente link. \n http://localhost:8080/canarium/signup?emailAddress="+User.getEmailAddress()+"&activate="+activationKey+" \n CanariUM");
            mailSender.send(mail);
            return "signup/thanks";
        }
    }

    @RequestMapping(value = "/index", produces = "text/html")
    public String index() {
        return "signup/index";
    }

    @RequestMapping(value = "/thanks", produces = "text/html")
    public String thanks() {
        return "signup/thanks";
    }
    @RequestMapping(value = "/error", produces = "text/html")
    public String error() {
        return "signup/error";
    }

    public void sendMessage(String mailTo, String message) {
        simpleMailMessage.setTo(mailTo);
        simpleMailMessage.setText(message);
        mailSender.send(simpleMailMessage);
    }
}

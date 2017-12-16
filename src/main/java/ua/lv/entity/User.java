package ua.lv.entity;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Entity
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String password;
    @Transient
    private String confirmPassword;
    private String email;
    private String firstName;
    private String lastName;
    private String avatar;
    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "user")
    private List<Account> accounts;


    public User() {
    }



    @Enumerated(EnumType.STRING)
    private Authority authority = Authority.ROLE_USER;


    private boolean accountNonExpired = true;
    private boolean accountNonLocked = true;
    private boolean credentialsNonExpired = true;
    private boolean enabled = true;

    private int finishedAllGoals = 0;
    private int finishedSucssesGoals = 0;
    private int finishedFailedGoals = 0;

    private Date dateOfRegistration = new Date();



    public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<SimpleGrantedAuthority> authorities = new ArrayList<SimpleGrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority(authority.name().toString()));
        return authorities;
    }

    public String getPassword() {
        return password;
    }

    public String getUsername() {
        return username;
    }

    public boolean isAccountNonExpired() {
        return accountNonExpired;
    }

    public boolean isAccountNonLocked() {
        return accountNonLocked;
    }

    public boolean isCredentialsNonExpired() {
        return credentialsNonExpired;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public List<Account> getAccounts() {
        return accounts;
    }

    public void setAccounts(List<Account> accounts) {
        this.accounts = accounts;
    }

    public Authority getAuthority() {
        return authority;
    }

    public void setAuthority(Authority authority) {
        this.authority = authority;
    }

    public void setAccountNonExpired(boolean accountNonExpired) {
        this.accountNonExpired = accountNonExpired;
    }

    public void setAccountNonLocked(boolean accountNonLocked) {
        this.accountNonLocked = accountNonLocked;
    }

    public void setCredentialsNonExpired(boolean credentialsNonExpired) {
        this.credentialsNonExpired = credentialsNonExpired;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(MultipartFile multipartFile) {

        if (multipartFile.isEmpty()) {
            this.avatar = null;
        }
        else{
            String path = System.getProperty("user.home") + File.separator + "Pictures\\";
            try {
                multipartFile.transferTo(new File(path + multipartFile.getOriginalFilename()));
            } catch (IOException e) {
                e.printStackTrace();
            }
            this.avatar = "\\avatar\\" + multipartFile.getOriginalFilename();

        }
    }

    public int getFinishedAllGoals() {
        return finishedAllGoals;
    }

    public void setFinishedAllGoals(int finishedAllGoals) {
        this.finishedAllGoals = finishedAllGoals;
    }

    public int getFinishedSucssesGoals() {
        return finishedSucssesGoals;
    }

    public void setFinishedSucssesGoals(int finishedSucssesGoals) {
        this.finishedSucssesGoals = finishedSucssesGoals;
    }

    public int getFinishedFailedGoals() {
        return finishedFailedGoals;
    }

    public void setFinishedFailedGoals(int finishedFailedGoals) {
        this.finishedFailedGoals = finishedFailedGoals;
    }

    public Date getDateOfRegistration() {
        return dateOfRegistration;
    }

    public void setDateOfRegistration(Date dateOfRegistration) {
        this.dateOfRegistration = dateOfRegistration;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", confirmPassword='" + confirmPassword + '\'' +
                ", email='" + email + '\'' +
                ", firstName='" + firstName + '\'' +
                ", lastName='" + lastName + '\'' +
                ", authority=" + authority +
                ", finishedAllGoals=" + finishedAllGoals +
                ", finishedSucssesGoals=" + finishedSucssesGoals +
                ", finishedFailedGoals=" + finishedFailedGoals +
                '}';
    }
}
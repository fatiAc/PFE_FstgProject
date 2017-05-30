/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import org.hibernate.validator.constraints.Email;

/**
 *
 * @author hp
 */
@Entity
public class Enseignant implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    private String cin;
    private String nom;
    private String prenom;
    private String tel;
     private String password;
     private boolean blocked;
    private int nbrCnx;
    private boolean mdpChanged;
    private boolean admine;
    private String grade;
    @Email
    private String email;
    @ManyToOne
    private Departement departement;
    @ManyToOne
    private Filiere filiere;
    @OneToMany(mappedBy = "chefEquipe")
    private List<EquipeRecherche> equipeRecherches;

    public Filiere getFiliere() {
        return filiere;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isBlocked() {
        return blocked;
    }

    public void setBlocked(boolean blocked) {
        this.blocked = blocked;
    }

    public int getNbrCnx() {
        return nbrCnx;
    }

    public void setNbrCnx(int nbrCnx) {
        this.nbrCnx = nbrCnx;
    }

    public boolean isMdpChanged() {
        return mdpChanged;
    }

    public void setMdpChanged(boolean mdpChanged) {
        this.mdpChanged = mdpChanged;
    }

    public boolean isAdmine() {
        return admine;
    }

    public void setAdmine(boolean admine) {
        this.admine = admine;
    }
    

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public List<EquipeRecherche> getEquipeRecherches() {
        return equipeRecherches;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }
    

    public void setEquipeRecherches(List<EquipeRecherche> equipeRecherches) {
        this.equipeRecherches = equipeRecherches;
    }
    

    public void setFiliere(Filiere filiere) {
        this.filiere = filiere;
    }

    public Departement getDepartement() {
        return departement;
    }

    public void setDepartement(Departement departement) {
        this.departement = departement;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (cin != null ? cin.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Enseignant other = (Enseignant) obj;
        if (!Objects.equals(this.cin, other.cin)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return nom + " " + prenom;
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Departement;
import bean.Filiere;
import controller.util.SearchUtil;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author HP
 */
@Stateless
public class FiliereFacade extends AbstractFacade<Filiere> {

    @PersistenceContext(unitName = "Pfe_FstgProjectPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public FiliereFacade() {
        super(Filiere.class);
    }

    public List<Filiere> findByType(int x, int y) {
        String requette = "SELECT f FROM Filiere f WHERE f.typeFiliere='" + x + "' AND f.typeFormation='" + y + "'";
        System.out.println(requette);
        return em.createQuery(requette).getResultList();
    }

    public List<Filiere> findByDepartm(Departement d,int x) {
        String requette = "SELECT f FROM Filiere f WHERE 1=1";
        if (x > 0) {
            requette += SearchUtil.addConstraint("f", "typeFiliere", "=", x);
        }
        if (d != null && d.getId() != null) {
            requette += SearchUtil.addConstraint("f.departement", "id", "=", d.getId());
            requette += " ORDER BY f.libelle";
        }
        return em.createQuery(requette).getResultList();
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Filiere;
import bean.Semestre;
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
public class SemestreFacade extends AbstractFacade<Semestre> {

    @PersistenceContext(unitName = "Pfe_FstgProjectPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public SemestreFacade() {
        super(Semestre.class);
    }

    public List<Semestre> findByFiliere(Filiere f) {
        String requette = "SELECT s FROM Semestre s WHERE 1=1 ";
        if (f != null && f.getId() != null) {
            System.out.println("============SemestreFacade==findByFiliere hahya dik lfilr " + f);
            requette += SearchUtil.addConstraint("s.filiere", "id", "=", f.getId());
            requette += " ORDER BY s.numero";
            System.out.println(requette);
            return em.createQuery(requette).getResultList();
        } else {
            System.out.println("=============no dataFound==========");
            return null;
        }
    }
}

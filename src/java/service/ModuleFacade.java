/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import bean.Filiere;
import bean.Module;
import controler.util.SearchUtil;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author HP
 */
@Stateless
public class ModuleFacade extends AbstractFacade<Module> {

    @PersistenceContext(unitName = "Pfe_FstgProjectPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ModuleFacade() {
        super(Module.class);
    }

    public List<Module> findByFiliere(Filiere f, int numSemestre) {
        String requette = "select m from Module m where 1=1 ";
        if (f.getId() != null) {
           requette+=SearchUtil.addConstraint("m.filiere", "id","=", f.getId());
        }
        if (numSemestre > 0) {
            requette += "AND m.semestre.numero=" + numSemestre;
        }
        return em.createQuery(requette).getResultList();
    }

}

package game;

import java.util.ArrayList;
import java.util.Iterator;

public class CartBean {
	private ArrayList<GameBean> clist;
	
	public CartBean() {
		clist = new ArrayList<GameBean>();
	}
	public ArrayList<GameBean> getAllCart(){
		return clist;
	}
	
	
	public boolean addCart(int gnum) throws Exception {
		GameBean gb = null;
		GameDAO gdao = GameDAO.getInstance();
		
		gb = gdao.getByGnum(gnum);
		
		for(int i=0;i<clist.size();i++) {
			int cGnum = clist.get(i).getGnum();
			if(cGnum == gnum) {
				return false;
			}
		}
		
		clist.add(gb);
		return true;
	}
	
	public void deletegame(String[] gnum) {
		Iterator<GameBean> it = clist.iterator();
		
		while(it.hasNext()) {
			GameBean gb = it.next();
			for(int i=0;i<gnum.length;i++) {
				if(String.valueOf(gb.getGnum()).equals(gnum[i])) {
					it.remove();
				}
			}
		}
	}
	
	public void deleteAllCart() {
		clist.clear();
	}
}

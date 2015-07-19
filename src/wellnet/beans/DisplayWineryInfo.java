package wellnet.beans;

import java.util.List;

import wellnet.dao.*;



public class DisplayWineryInfo{
	
	public DisplayWineryInfo(){

	}
	
	public String displayWines(List<Wine> wines){
		StringBuilder sb = new StringBuilder();
		
		sb.append("<div>");
		
		for(Wine w : wines){
			sb.append("<br><hr><br>");
			sb.append("<table><tr><td>");
		    sb.append("Name: " + encodeHTML(w.getName()));
		    sb.append("</td><td>");
		    sb.append("Year: " + encodeHTML(String.valueOf(w.getYear())));
		    sb.append("</td><td>");
		    sb.append("Type: " + encodeHTML(w.getType()));
		    sb.append("</td><td>");
		    sb.append("Stock: " + encodeHTML(String.valueOf(w.getStock())));
		    sb.append("</td></tr><tr><td colspan=\"4\"><br></td></tr><tr><td colspan=\"4\">");
		    sb.append(encodeHTML(w.getPromoMaterials()));
		    sb.append("</td></tr><tr><td colspan=\"4\"><br></td></tr><tr><td colspan=\"4\">");
		    sb.append(encodeHTML(w.getPairingTastingNotes()));
		    sb.append("</td></tr></table>");
			
		}
		
		sb.append("</div>");
		
		return sb.toString();
	}
	
	public String displayWineryBio(WineryBio wineryBio){
		return encodeHTML(wineryBio.getBio());
	}
	
	private String encodeHTML(String unsafeString)
	{
	    StringBuffer safeString = new StringBuffer();
	    for(int i=0; i<unsafeString.length(); i++)
	    {
	        char c = unsafeString.charAt(i);
	        if(c > 127 || c=='"' || c=='<' || c=='>')
	        {
	           safeString.append("&#"+(int)c+";");
	        }
	        else
	        {
	            safeString.append(c);
	        }
	    }
	    return safeString.toString();
	}

}

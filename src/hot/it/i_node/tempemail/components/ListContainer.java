package it.i_node.tempemail.components;

import it.i_node.tempemail.json.JsonMail;

import java.io.Serializable;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlSeeAlso;
@XmlRootElement(name="data")
@XmlSeeAlso(JsonMail.class)
public class ListContainer<T> implements Serializable {
        public ListContainer() {
                // TODO Auto-generated constructor stub
        }

        /**
         *
         */
        private static final long serialVersionUID = 1L;
        private List<T> aaData;
        private int sEcho=1;
        private int iTotalRecords;
        private int iTotalDisplayRecords;

        public ListContainer(List<T> events) {
                // TODO Auto-generated constructor stub
                setAaData(events);
        }

		public List<T> getAaData() {
			
			return aaData;
		}

		public void setAaData(List<T> aaData) {
			this.aaData = aaData;
		}

		public int getsEcho() {
			return sEcho;
		}

		public void setsEcho(int sEcho) {
			this.sEcho = sEcho;
		}

		public int getiTotalRecords() {
			if(aaData!=null)
				iTotalRecords=aaData.size();
			return iTotalRecords;
		}

		public void setiTotalRecords(int iTotalRecords) {
			this.iTotalRecords = iTotalRecords;
		}

		public int getiTotalDisplayRecords() {
			if(aaData!=null)
				iTotalDisplayRecords=aaData.size();
			return iTotalDisplayRecords;
		}

		public void setiTotalDisplayRecords(int iTotalDisplayRecords) {
			this.iTotalDisplayRecords = iTotalDisplayRecords;
		}

     
        
        
}

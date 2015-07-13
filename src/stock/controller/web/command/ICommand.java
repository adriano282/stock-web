package stock.controller.web.command;

import stock.core.application.Result;
import domain.DomainEntity;

public interface ICommand {
	
	public Result execute(DomainEntity entity);

	public Result execute(DomainEntity entidade, Integer page, Integer recordsPerPage);

}
